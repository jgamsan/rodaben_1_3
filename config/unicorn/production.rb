
wd = "/home/galiclick/public_html/neumaticos/current"
working_directory wd
pid "#{wd}/tmp/pids/unicorn.pid"
stderr_path "#{wd}/log/unicorn.log"
stdout_path "#{wd}/log/unicorn.log"
preload_app true
listen "#{wd}/tmp/unicorn.todo.sock"
worker_processes 2
timeout 240
before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
