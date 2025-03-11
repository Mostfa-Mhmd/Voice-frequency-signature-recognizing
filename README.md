# voice Frequency Signature recognizer

## Overview
This project is a DSP application of FFT using MATLAB, utilizing the frequency domain of a signal as a kind of biometric, similar to fingerprints in modern mobile devices.

## Process
1. **Function: audioFreq**  
   - Takes an input audio file name.  
   - Outputs its frequency domain representation (Y, f), amplitude as a matrix, and sample rate.  

2. **Function: fdata**  
   - Takes an input signal and applies an FIR Band-Pass filter.  
   - The filter is based on a reference audio file (freq_500_to_1000.wav).  
   - Filter type: Contractive Band Equiripple with a minimum order of 11.  

## Main Function
1. Calls audioFreq to read the reference file, which acts as an indicator for the input file.  
2. Calls fdata to apply FIR Band-Pass filter coefficients and stores the filtered file.  
3. The user is prompted to insert an audio file for testing.  
4. fdata processes the input file, storing it for audioFreq to analyze its frequency domain.  
5. Two figures are created:  
   - The first records the frequency transformation of four cases.  
   - The second records the reference and input audio files before and after filtering.  

## Comparison Algorithm
- The comparison between the filtered reference and filtered input uses a small tolerance factor to account for minor signal changes after filtering.  
- An if statement determines whether the signals are similar or not.  

## Terminal Output Examples
### Similarity Case  
- When the input matches the reference within the tolerance.  

### Non-Similarity Case  
- When the input does not match the reference.  

## Potential Improvements
- Modify the reference audio model to allow dynamic input selection.  
- Adjust the pass-band filter based on the selected reference.  
- Improve the algorithm to compare sounds with minor frequency variations.  
- Adapt the system for real-time operation.  

---

*Author:* Mostafa Mohamed
