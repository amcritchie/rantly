// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function () {

    setTimeout(function () {
        $(".flashFail").fadeOut('slow');
        $(".flashSuccess").fadeOut('slow');
    }, 1000);

    $('.followButton').on('click', function (e) {

        e.preventDefault();
        e.stopPropagation();

        var followButton = $(this);

        if (followButton.attr('data-following') == 'true') {

            $.post('/users/0/followings.json', {id: $(this).attr('data-userid')}).success();

            $('.followButton[data-userid=' + $(this).attr('data-userid') + ']').empty().text('Unfollow').attr('data-following', 'false');

        } else {

            $.ajax({
                type: 'delete',
                url: ('/users/0/followings/' + $(this).attr('data-userid')),
                dataType: 'json'
            });

            $('.followButton[data-userid=' + $(this).attr('data-userid') + ']').empty().text('Follow').attr('data-following', 'true');

        }

    });


    $('.favoriteButton').on('click', function (e) {

        e.preventDefault();
        e.stopPropagation();

        var favoriteButton = $(this);
        var favCount = favoriteButton.attr('data-favcount');

        debugger;
        if (favCount == '0') {

            $.post('/rants/' + $(this).attr('data-rantid') + '/favorites.json', {rant_id: $(this).attr('data-rantid')}).success();

            $('.favoriteButton[data-rantid=' + $(this).attr('data-rantid') + ']').empty().text((parseInt(favCount) + 1) + '-Unfavorite').attr('data-favcount', favoriteButton.attr('data-favcount') + 1);

        } else {

            $.ajax({
                type: 'delete',
                url: ('/rants/' + $(this).attr('data-rantid') + '/favorites/' + $(this).attr('data-rantid')),
                dataType: 'json'
            });

            $('.favoriteButton[data-rantid=' + $(this).attr('data-rantid') + ']').empty().text('Favorite').attr('data-favcount', 'true');
        }

    });


});