<CsoundSynthesizer>
<CsInstruments>
sr      = 44100
; ksmps must be an even divisor of the Max signal vector size
ksmps   = 16
nchnls  = 2
0dbfs = 0.9


instr 1

kDens chnget "dens"
gkDur chnget "dur"
gkFreq chnget "freq"
gkSpreadFreq chnget "spreadfreq"
gkHarm chnget "harm"

gkPhase chnget "phase"

gSfilepath = "PAROLAI.WAV"
gitableL    ftgen    1,0,0,1,gSfilepath,0,0,1

giLenTable = ftlen(gitableL)
giDurata = giLenTable / sr

kTrig metro kDens
schedkwhen kTrig, 0, 0, 2, 0, gkDur

endin

instr 2

  iPhase = ((i(gkPhase) / 1000) / giDurata) * giLenTable
  iHarm = int(rnd(i(gkHarm))) + 1
  aEnv linseg 0, i(gkDur), 1, i(gkDur), 0
  aSig lposcil 0.5 / iHarm, i(gkFreq) * iHarm , 0, 0, gitableL,iPhase

  aL, aR pan2 aSig * aEnv, rnd(1)
  outs aL, aR
  
endin

</CsInstruments>

<CsScore>
; keep csound active for realtime events
; change this to see the bang on score completion
f 0 3600         

i1 0 -1


</CsScore>
</CsoundSynthesizer>


