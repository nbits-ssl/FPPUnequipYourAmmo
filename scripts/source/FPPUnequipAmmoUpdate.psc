Scriptname FPPUnequipAmmoUpdate extends Quest

Event Oninit()
	RegisterForSingleUpdate(10)
EndEvent

Event OnUpdate()
	if (FPPAUA.IsRunning())
		FPPAUA.Stop()
		FPPAUA.Start()
	else
		FPPAUA.Start()
	endif
	
	RegisterForSingleUpdate(30)
EndEvent

Quest Property FPPAUA  Auto  