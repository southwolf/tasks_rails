class ChangeObserver < ActiveRecord::Observer
  observe :task

  # no metaprogramming here, just copy and paste, so code readability kept safe
  def after_create(record)
    create_event_log(record, 'created')
  end

  def after_update(record)
    create_event_log(record, 'updated')
  end

  def after_destroy(record)
    create_event_log(record, 'destroyed')
  end

  private

  def create_event_log(event_source, event_name)
    if PaperTrail.enabled?
      version = event_source.versions.last
      changes_logger.info("#{event_source.class.name} ##{event_source.id} #{event_name}, changes: #{version.changeset}")
    end
  end

  def changes_logger
    @@changes_logger ||= Logger.new("#{Rails.root}/log/changes.log")
  end
end
