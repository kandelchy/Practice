# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#people').dataTable
    processing: true
    serverSide: true
    bFilter: true
    ajax: $('#people').data('source')
    pagingType: 'full_numbers',
    bProcessing: true,
    order: [[0,'asc']],
    pageLength: 10,
    aoColumnDefs: [
      { 'bSortable': false, 'aTargets': [2,3,4,5,6] }
    ]
    $.fn.dataTableExt.errMode= 'ignore',
  return


$("#person_addresses").dataTable();

# $(document).on('turbolinks:load', function() {
#   $('.person_check').change(function() {
#     $.ajax({
#       url: 'people/' + this.id + '/change_status/',
#       type: 'post'
#     });
#   });
