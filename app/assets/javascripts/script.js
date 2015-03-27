$(function(){
	/* ===Галерея товаров=== */
    var ImgArr, ImgLen;
    //Предварительная загрузка
    function Preload (url)
    {
       if (!ImgArr){
           ImgArr=new Array();
           ImgLen=0;
       }
       ImgArr[ImgLen]=new Image();
       ImgArr[ImgLen].src=url;
       ImgLen++;
    }
    $('.item_thumbs a').each(function(){
       Preload( $(this).attr('href') );
    })


    //обвес клика по превью
    $('.item_thumbs a').click(function(e){
       e.preventDefault();
       if(!$(this).hasClass('active')){
           var target = $(this).attr('href');

           $('.item_thumbs a').removeClass('active');
           $(this).addClass('active');

           $('.item_img img').fadeOut('fast', function(){
               $(this).attr('src', target).load(function(){
                   $(this).fadeIn();
               })
           })
       }
    });
    $('.item_thumbs a:first').trigger('click');
    /* ===Галерея товаров=== */
    })