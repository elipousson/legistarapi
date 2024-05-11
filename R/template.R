#' Get a Legistar Web API URL GET Template
#'
#' Review the [Legistar Web API](https://webapi.legistar.com/) documentation for
#' more information. See [this reference Google
#' Sheet](https://docs.google.com/spreadsheets/d/1Py-Oqyb8kW13x0_BjGJS-fw1EdZzqBeIsjxvQvBV5dM/edit?usp=sharing)
#' to see the URL patterns. A function to list the templates with definitions
#' for the purpose of each endpoint will be added in the future.
#'
#' @param template Template string corresponding to a template endpoint, e.g.
#'   `actions = "{client}/Actions"`, `bodies = "{client}/Bodies"`,
#'   or `code_sections = "{client}/CodeSections"`
#' @keywords internal
legistar_template <- function(template, method = "GET", version = 1) {
#' @export
legistar_template <- function(template = "actions", method = "GET", version = 1) {
  template <- switch (template,
          actions = "{client}/Actions",
          actions_action_id = "{client}/Actions/{action_id}",
          bodies = "{client}/Bodies",
          bodies_body_id = "{client}/Bodies/{body_id}",
          body_types = "{client}/BodyTypes",
          body_types_body_type_id = "{client}/BodyTypes/{body_type_id}",
          code_sections = "{client}/CodeSections",
          code_sections_code_section_id = "{client}/CodeSections/{code_section_id}",
          events_event_id_event_items_agenda_note_minutes_note_attachments = "{client}/Events/{event_id}/EventItems?AgendaNote={agenda_note}&MinutesNote={minute_note}&Attachments={attachments}",
          events_event_id_event_items_event_item_id_agenda_note_minutes_note_attachments = "{client}/Events/{event_id}/EventItems/{event_item_id}?AgendaNote={agenda_note}&MinutesNote={minute_note}&Attachments={attachments}",
          events = "{client}/Events",
          event_dates_body_id_future_dates_only = "{client}/EventDates/{body_id}?FutureDatesOnly={future_dates_only}",
          events_event_id_event_items_agenda_note_minutes_note_event_item_attachments = "{client}/Events/{event_id}?EventItems={event_items}}&AgendaNote={agenda_note}&MinutesNote={minute_note}&EventItemAttachments={event_item_attachments}",
          indexes = "{client}/Indexes",
          indexes_index_id = "{client}/Indexes/{index_id}",
          matters_matter_id_attachments = "{client}/Matters/{matter_id}/Attachments",
          matters_matter_id_attachments_matter_attachment_id = "{client}/Matters/{matter_id}/Attachments/{matter_attachment_id}",
          matters_matter_id_attachments_matter_attachment_id_file = "{client}/Matters/{matter_id}/Attachments/{matter_attachment_id}/File",
          matters_matter_id_code_sections = "{client}/Matters/{matter_id}/CodeSections",
          matters_matter_id_code_sections_matter_code_section_id = "{client}/Matters/{matter_id}/CodeSections/{MatterCodeSectionId}",
          matters_matter_id_histories_agenda_note_minutes_note = "{client}/Matters/{matter_id}/Histories?AgendaNote={agenda_note}&MinutesNote={minute_note}",
          matters_matter_id_histories_matter_history_id_agenda_note_minutes_note = "{client}/Matters/{matter_id}/Histories/{matter_history_id}?AgendaNote={agenda_note}&MinutesNote={minute_note}",
          matter_indexes = "{client}/MatterIndexes",
          matter_indexes_matter_index_id = "{client}/MatterIndexes/{matter_index_id}",
          matter_indexes_index_index_id = "{client}/MatterIndexes/Index/{index_id}",
          matter_indexes_matter_matter_id = "{client}/MatterIndexes/Matter/{matter_id}",
          matters_matter_id_indexes = "{client}/Matters/{matter_id}/Indexes",
          matters_matter_id_indexes_matter_index_id = "{client}/Matters/{matter_id}/Indexes/{matter_index_id}",
          matters_matter_id_relations = "{client}/Matters/{matter_id}/Relations",
          matters_matter_id_relations_matter_relation_id = "{client}/Matters/{matter_id}/Relations/{matter_relation_id}",
          matter_requesters = "{client}/MatterRequesters",
          matters = "{client}/Matters",
          matters_matter_id = "{client}/Matters/{matter_id}",
          matters_matter_id_sponsors = "{client}/Matters/{matter_id}/Sponsors",
          matters_matter_id_sponsors_matter_sponsor_id = "{client}/Matters/{matter_id}/Sponsors/{matter_sponsor_id}",
          matter_statuses = "{client}/MatterStatuses",
          matter_statuses_matter_status_id = "{client}/MatterStatuses/{matter_status_id}",
          matters_matter_id_texts_matter_text_id = "{client}/Matters/{matter_id}/Texts/{matter_text_id}",
          matters_matter_id_versions = "{client}/Matters/{matter_id}/Versions",
          matter_types = "{client}/MatterTypes",
          matter_types_matter_type_id = "{client}/MatterTypes/{matter_type_id}",
          office_records = "{client}/OfficeRecords",
          persons_person_id_office_records = "{client}/Persons/{person_id}/OfficeRecords",
          bodies_body_id_office_records = "{client}/Bodies/{body_id}/OfficeRecords",
          office_records_office_record_id = "{client}/OfficeRecords/{office_record_id}",
          persons = "{client}/Persons",
          persons_person_id = "{client}/Persons/{person_id}",
          event_items_event_item_id_roll_calls = "{client}/EventItems/{event_item_id}/RollCalls",
          event_items_event_item_id_roll_calls_roll_call_id = "{client}/EventItems/{event_item_id}/RollCalls/{roll_call_id}",
          persons_person_id_roll_calls = "{client}/Persons/{person_id}/RollCalls",
          event_items_event_item_id_votes = "{client}/EventItems/{event_item_id}/Votes",
          event_items_event_item_id_votes_vote_id = "{client}/EventItems/{event_item_id}/Votes/{vote_id}",
          persons_person_id_votes = "{client}/Persons/{person_id}/Votes",
          vote_types = "{client}/VoteTypes",
          vote_types_vote_type_id = "{client}/VoteTypes/{vote_type_id}"
  )

  paste0(method, " v", version, "/", template)
}
