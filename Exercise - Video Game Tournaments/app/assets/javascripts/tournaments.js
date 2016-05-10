// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('.ctrl-tournaments.actn-index').ready(tournamentsIndex)

$('[data-hook~=tourney-add]').on('click', showTournamentForm)
$('[data-hook~=tourney-form]').on('submit', createTournament)
$('.ctrl-tournaments.actn-index').on('click', '[data-hook~=tourney-delete]', deleteTournament )
$('.ctrl-tournaments.actn-index').on('click', '[data-hook~=player-add]', addPlayer )
$('[data-hook~=player-form]').on('submit', addPlayerToTournament)


function deleteTournament(event){
	event.preventDefault();
	var self = $(this);

	var tournamentId = $(this).val();
	var request = $.ajax({
      url: '/api/tournaments/' + tournamentId,
      type: 'DELETE',
      success: function(response){
      	self.parent().remove();
      },
      datatype: 'json'
    });
}

function addPlayer(event){
	event.preventDefault();
	$('.js-change-id').val($(this).val());
	$('[data-hook~=player-form]').removeClass('hidden');
}

function addPlayerToTournament(event){
	event.preventDefault();
	var tournamentId = $(this).find('.js-change-id').val();
	var playerId = $(this).find('#player-name').val();

	$.ajax({
      url: '/api/tournaments/' + tournamentId + '/player/' + playerId + '/add',
      type: 'PATCH',
      success: function(response){
      	$('[data-hook~=player-form]').addClass('hidden');
      },
      datatype: 'json'
    });
}