-- Global --

version = { 0, 1, 0 }
dbg_message      = true

-- Windows configuration --

win_name         = "Les terres du cauchemard v" ..version[1].. "." ..version[2].. "." ..version[3]
win_posx         = 100
win_posy         = 100
win_frame_buffer = 32 -- bits
win_z_buffer     = 16 -- bits
win_multi_sample = 1 -- no
win_sync         = true
win_fullscreen   = false

if win_fullscreen then

	win_width  = GetScreenWidth()
	win_height = GetScreenHeight()

else

	win_width  = 800
	win_height = 600

end
