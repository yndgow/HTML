$(".submenu").hide();

$(".menu").on('click', ()=>{
    $(".submenu").slideDown("slow")
});

$(".close").on('click', (e)=>{
    e.stopPropagation();
    $(".submenu").slideUp("fast");
});

