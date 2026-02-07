$(document).ready(function() {
    var tab1 = $('#tab_1');
    var tab2 = $('#tab_2');
    var tab3 = $('#tab_3');
    var tab4 = $('#tab_4');

    var block1 = $('#pb_1');
    var block2 = $('#pb_2');
    var block3 = $('#pb_3');
    var block4 = $('#pb_4');

    tab1.bind('mouseover', function() {
        tab1.attr('class', 'selTab');
        tab2.attr('class', 'tab');
        tab3.attr('class', 'tab');
        tab4.attr('class', 'tab');

        tab1.css('background', 'url(/images/seltab_bg.png) no-repeat top left');
        tab2.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab3.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab4.css('background', 'url(/images/tab_bg.png) no-repeat top left');

        block1.css('display', 'block');
        block2.css('display', 'none');
        block3.css('display', 'none');
        block4.css('display', 'none');
    });

    tab2.bind('mouseover', function() {
        tab1.attr('class', 'tab');
        tab2.attr('class', 'selTab');
        tab3.attr('class', 'tab');
        tab4.attr('class', 'tab');

        tab1.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab2.css('background', 'url(/images/seltab_bg.png) no-repeat top left');
        tab3.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab4.css('background', 'url(/images/tab_bg.png) no-repeat top left');

        block1.css('display', 'none');
        block2.css('display', 'block');
        block3.css('display', 'none');
        block4.css('display', 'none');
    });

    tab3.bind('mouseover', function() {
        tab1.attr('class', 'tab');
        tab2.attr('class', 'tab');
        tab3.attr('class', 'selTab');
        tab4.attr('class', 'tab');

        tab1.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab2.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab3.css('background', 'url(/images/seltab_bg.png) no-repeat top left');
        tab4.css('background', 'url(/images/tab_bg.png) no-repeat top left');

        block1.css('display', 'none');
        block2.css('display', 'none');
        block3.css('display', 'block');
        block4.css('display', 'none');
    });

    tab4.bind('mouseover', function() {
        tab1.attr('class', 'tab');
        tab2.attr('class', 'tab');
        tab3.attr('class', 'tab');
        tab4.attr('class', 'selTab');

        tab1.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab2.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab3.css('background', 'url(/images/tab_bg.png) no-repeat top left');
        tab4.css('background', 'url(/images/seltab_bg.png) no-repeat top left');

        block1.css('display', 'none');
        block2.css('display', 'none');
        block3.css('display', 'none');
        block4.css('display', 'block');
    });
    $('.e-button').bind('click', function() {
        var link = $(this);
        link.removeClass('e-button-p');
        link.addClass('e-button');
    });

    $('.e-button').bind('mousedown', function() {
        var link = $(this);
        link.removeClass('e-button');
        link.addClass('e-button-p');
    });

    $('.e-button').bind('mouseup', function() {
        var link = $(this);
        link.removeClass('e-button-p');
        link.addClass('e-button');
    });

    $('.e-button').bind('mouseout', function() {
        var link = $(this);
        link.removeClass('e-button-p');
        link.addClass('e-button');
    });
});