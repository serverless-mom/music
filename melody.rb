

# Welcome to Sonic Pi

in_thread do
  loop do
    use_synth :beep
    chords = [chord(:C, :major), chord(:G, :major), chord(:A3, :minor), chord(:F4, :major)].ring # a ring of chords
    c = chords.tick  # save next chord to a variable 'c'
    play c[0], pitch: 12.01 if one_in(2)
    play c[2]
    sleep 0.5
    use_synth :saw
    play c.choose, pitch: -24.01, sustain: 0.5, amp: 0.3
    use_synth :beep
    play c, attack: 0.02, sustain: 0.2
    sleep 1
  end
end

sleep 4
with_fx :gverb, phase: 0.25, wave: 3 do
  
  loop do
    
    use_synth :saw
    chords = [chord(:C4, :major), chord(:G3, :major), chord(:A3, :minor), chord(:F3, :major)].ring # a ring of chords
    c = chords.tick
    # play c.choose, attack: 0.02, sustain: 0.5, amp: 0.2
    sleep 1.5
  end
end
