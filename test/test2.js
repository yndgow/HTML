const chartInit = {
  version: 1,
  stockDetailChart: null,
  stockDetailChart2: null,
  
  init: function() {
    this.stockDetailChart = this.createChart(document.getElementById('stockDetailchart'), 'line', {
      data: {
        labels: [],
        datasets: [{ label: '', data: [] }]
      },
      options: { /* ...생략... */ }
    });

    this.stockDetailChart2 = this.createChart(document.getElementById('stockDetailchart2'), 'bar', {
      data: {
        labels: [],
        datasets: [{ label: '', data: [] }]
      },
      options: { /* ...생략... */ }
    });

    const chartDateButtons = document.getElementsByClassName('btnChartDate');
    Array.from(chartDateButtons).forEach(button =>
      button.addEventListener('click', this.handleChartButtonClick.bind(this))
    );
  },
  
  createChart: function(context, type, options) {
    return new Chart(context, { type, ...options });
  },
  
  handleChartButtonClick: async function(event) {
    const dateType = event.target.dataset.date;
    const companyCode = document.getElementById('companyCode').textContent.trim();
    await this.fetchAndUpdateChartData(companyCode, dateType);
  },
  
  fetchAndUpdateChartData: async function(companyCode, dateType) {
    try {
      const response = await fetch(`/stock/InquireDailyItemChartPrice/${companyCode}/${dateType}`);
      const { output2 } = await response.json();
      const chartLabels = output2.map(item => item.stck_bsop_date);
      const chartData = output2.map(item => item.stck_clpr);
      const chartData2 = output2.map(item => item.acml_vol);
      this.updateChart(this.stockDetailChart, chartLabels, chartData, '종가');
      this.updateChart(this.stockDetailChart2, chartLabels, chartData2, '거래량');
    } catch (error) {
      console.error('Error fetching chart data:', error);
    }
  },
  
  updateChart: function(chart, labels, data, label) {
    chart.data.labels = labels;
    chart.data.datasets[0].label = label;
    chart.data.datasets[0].data = data;
    chart.update();
  }
};

chartInit.init();
