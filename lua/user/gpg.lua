local status_ok, gnupg = pcall(require, "vim-gnupg")
if not status_ok then
  print "vim-gnupg init failed"
  return
end

gnupg.setup { }
