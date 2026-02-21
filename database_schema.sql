-- Creates the main table for storing student tasks
CREATE TABLE IF NOT EXISTS student_tasks (
  id SERIAL PRIMARY KEY,
  task_name TEXT NOT NULL,
  due_date TIMESTAMP WITH TIME ZONE NOT NULL,
  status TEXT DEFAULT 'upcoming' -- Automatically sets status for new tasks
);
