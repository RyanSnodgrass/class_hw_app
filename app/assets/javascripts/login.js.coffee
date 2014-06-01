$ ->
	modal = $('.overlay')

	$('.add').on 'click', ->
		modal.fadeIn 'fast'

	$('.close-reveal-modal').on 'click', ->
		modal.fadeOut 'slow'