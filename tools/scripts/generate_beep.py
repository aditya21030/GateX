import math
import wave
import struct
import os

os.makedirs('assets/audio', exist_ok=True)

# Generate a 1-second 880Hz sine wave beep
sample_rate = 44100
duration_seconds = 1.0
frequency = 880.0

with wave.open('assets/audio/beep.wav', 'w') as wav_file:
    wav_file.setnchannels(1)
    wav_file.setsampwidth(2)
    wav_file.setframerate(sample_rate)
    
    for i in range(int(sample_rate * duration_seconds)):
        value = int(32767.0 * math.sin(2.0 * math.pi * frequency * i / sample_rate))
        # Add a simple envelope to prevent clicking
        envelope = 1.0
        if i < 441: envelope = i / 441.0
        elif i > (sample_rate * duration_seconds - 441): envelope = (sample_rate * duration_seconds - i) / 441.0
        
        value = int(value * envelope)
        data = struct.pack('<h', value)
        wav_file.writeframesraw(data)

print("Generated assets/audio/beep.wav")
