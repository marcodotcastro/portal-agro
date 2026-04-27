// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require Chart.bundle
//= require chartkick
//= require clipboard
//= require_tree .

$(document).ready(function () {
    $(".menu-icon").on("click", function () {
        $("nav ul").toggleClass("showing");
    });
});

// Scrolling Effect

$(window).on("scroll", function () {
    if ($(window).scrollTop()) {
        $('nav').addClass('black');
    } else {
        $('nav').removeClass('black');
    }
})

$(document).ready(function () {

    // Tooltip

    $('.clipboard-btn').tooltip({
        trigger: 'click',
        placement: 'bottom'
    });

    function setTooltip(btn, message) {
        $(btn).tooltip('show')
            .attr('data-original-title', message)
            .tooltip('show');
    }

    function hideTooltip(btn) {
        setTimeout(function () {
            $(btn).tooltip('hide');
        }, 1000);
    }

// Clipboard

    var clipboard = new Clipboard('.clipboard-btn');

    clipboard.on('success', function (e) {
        setTooltip(e.trigger, 'Copiado!');
        hideTooltip(e.trigger);
    });

    clipboard.on('error', function (e) {
        setTooltip(e.trigger, 'Não Copiado!');
        hideTooltip(e.trigger);
    });

});

function scrollToSearchFilters() {
    var pathMatch = /^\/estados\/goias\/(produtores|produtos|servicos)$/.test(window.location.pathname);
    var hasSearchQuery = window.location.search.indexOf("q%5B") >= 0 || window.location.search.indexOf("q[") >= 0;

    if (!pathMatch || !hasSearchQuery) return;

    var anchor = document.querySelector('[data-search-filters-anchor="true"]');
    if (!anchor) return;

    var header = document.querySelector('.site-header');
    var headerHeight = header ? header.getBoundingClientRect().height : 0;
    var visualGap = 56;
    var targetTop = anchor.getBoundingClientRect().top + window.pageYOffset - headerHeight - visualGap;

    window.requestAnimationFrame(function () {
        window.scrollTo(0, Math.max(targetTop, 0));
    });
}

document.addEventListener('turbolinks:load', scrollToSearchFilters);
