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
gkFreqMod chnget "freqmod"
gkIndex chnget "index"

kTrig metro kDens
schedkwhen kTrig, 0, 0, 2, 0, gkDur

endin

instr 2
  
  iFreqSpread = rnd(i(gkSpreadFreq)) - (i(gkSpreadFreq) / 2)
  iHarm = int(rnd(i(gkHarm)) + 1)
  aFreq = (i(gkFreq) + iFreqSpread) * iHarm
  
  aEnv linseg 0, i(gkDur) / 2, 1, i(gkDur) / 2, 0
  iFreqDev = i(gkFreqMod) * i(gkIndex)
  aFreqDev oscili iFreqDev, i(gkFreqMod)
  aSig oscili 0.05 / iHarm , aFreq + aFreqDev
  
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


