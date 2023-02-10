document.addEventListener('DOMContentLoaded',()=>{
    let answer = document.getElementsByClassName('qna_stat');
    for (let i = 0; i < answer.length; i++) {

        if(answer[i].textContent === '0'){
            answer[i].textContent = '검토중';
            answer[i].style.color = 'gray';
        }else{
            answer[i].textContent = '답변완료';
            answer[i].style.color = 'green';
        }
        console.log(answer[i]);
    }
    
    

});