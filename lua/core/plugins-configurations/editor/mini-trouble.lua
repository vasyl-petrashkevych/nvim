local status, trouble = pcall(require, "mini.trouble")
if (not status) then return end

trouble.setup()
