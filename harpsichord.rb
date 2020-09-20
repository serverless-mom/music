use_synth :dull_bell
use_random_seed 30

live_loop :bax do
  with_fx :lpf, amp: 0.5 do
    # play [:C4, chord(:c, :maj)].choose    , release: 5 , amp: 1.2
    sleep 3
    # play [chord(:f, :maj),:A4].choose
    sleep 3
  end
end# Welcome to Sonic Pi

drums = [:drum_bass_hard, :drum_snare_soft, :drum_cymbal_open,:drum_bass_soft, :drum_cymbal_closed].ring
live_loop :drums do
  sample drums.tick, amp: rrand(0.5,0.6)
  if drums.tick == :drum_bass_hard
    sleep 0.25
  else
    sleep 0.5
  end
end


sleep 2
chords = [chord(:C3, :major),chord(:G3, :major), chord(:A3, :minor), chord(:F3, :major)].ring
with_fx :reverb, damp: 0.1, amp: 0.9 do
  loop do
    use_synth :pluck
    measure = chords.tick
    play measure[3], pitch: 12
    play measure[0], release: 0.5, cutoff: 20
    sleep 0.5
    play measure[1]
    sleep 0.25
    play measure[1], pitch: -12, amp: 0.2
    play measure[2], release: 0.5, cutoff: 20, amp:0.4
    play measure[1], release: 0.5, cutoff: 20, amp:0.3
    sleep 0.25
    play measure
    sleep 0.5
    play measure[0], pitch: -12, amp: 0.3
    play chord([:c4, :c5].choose, :major), amp: 0.8
    sleep 0.5
  end
end

