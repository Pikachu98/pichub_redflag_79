$(document).ready(function(){
    var $container = $('#masonry');
    $container.imagesLoaded(function(){
        $container.masonry({
            itemSelector: '.view',
            columnWidth: 15//每两列之间的间隙为13像素
        });
    });
});