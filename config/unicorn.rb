worker_processes 3
timeout 30
preload_app true
stderr_path File.join(Dir.pwd, "log", "unicorn.stderr.log")
stdout_path File.join(Dir.pwd, "log", "unicorn.stdout.log")
