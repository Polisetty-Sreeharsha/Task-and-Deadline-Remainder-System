-- Schedules the reminder function to run every 1 minute
SELECT cron.schedule(
  'task-reminder-minute', 
  '* * * * *', 
  'SELECT check_and_send_reminders()'
);
