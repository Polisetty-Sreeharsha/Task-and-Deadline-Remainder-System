CREATE OR REPLACE FUNCTION public.check_and_send_reminders()
RETURNS void AS $$
BEGIN
  PERFORM
    net.http_post(
      url := 'https://api.telegram.org/bot8359158447:AAFPP8MBVrypoqEBVtGKfsUVOeAqGur1H4M/sendMessage',
      headers := '{"Content-Type": "application/json"}'::jsonb,
      body := json_build_object(
        'chat_id', 7093643261,
        'text', '⏰ REMINDER: Your task "' || task_name || '" is due soon! 🚀'
      )::jsonb
    )
  FROM student_tasks
  -- Only send for 'upcoming' tasks within the 5-minute IST window
  WHERE status = 'upcoming'
    AND due_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' >= (now() AT TIME ZONE 'UTC' AT TIME ZONE 'IST' + interval '4 minutes')
    AND due_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' <= (now() AT TIME ZONE 'UTC' AT TIME ZONE 'IST' + interval '6 minutes');
END;
$$ LANGUAGE plpgsql;
