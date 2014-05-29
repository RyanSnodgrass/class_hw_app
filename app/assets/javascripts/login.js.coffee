$ ->
	modal = $('.overlay')

	$('.login').on 'click', ->
		modal.fadeIn 'fast'

	$('.close-reveal-modal').on 'click', ->
		modal.fadeOut 'slow'