### This is work in progress.

## Some random notes.

# Performance.

On Coffee Lake one squaring/multiplication was measured to be ~46.8 cycles. Penta-root is 282 squarings/multiplications. Then MinRoot itself costs a few additions, which can add up to about one multiplication, so let's say we aim for 283*46.8=13244.4 cycles per MinRoot iteration. The measured result is ~13570 cycles, which is 2.5% off the goal. In absolute terms the difference is ~325 cycles. This is for 35 calls to assembly subroutines, or ~9.3 "excess" cycles per call. These are divided among pure call overheads and mispredicted branch penalties. If all these were branch penalties, then it's equivalent of ~1/2 of them being mispredicted. This is a bit too high, the processor should and surely does better. Maybe one can shave off 5-6 cycles per call by implementing the whole penta-root in assembly. 6 cycles would amount for ~1.5% overall improvement. But this is not given, because out-of-order core is capable of amortizing the calls overheads cycles, and all of the 1.5% can just as well be the result of occasional imperfections in instruction scheduling. For this reason it's argued that whole penta-root in assembly is not worth the effort.

Just in case. Implementing complete point operations in assembly would be more benefitial, because those are mixtures of multiplications and faster additions/subtractions, so that overheads take larger percentage.

There is room for improvement in disjoint multiplication and squaring subroutines. It is the "composite" square-n-multiply subroutine that is specifically tuned for Pasta moduli.

# Interface.

C currently takes in and emits two-dimentional arrays of 64-bit limbs. This is surely less optimal from application viewpoint. Would it be more appropriate to take in and emit pairs of byte arrays? Perform operation in place?

# Platform support.

ARM64 and legacy x86_64 are supported mostly to facilitate development, not production. In other words no assumptions are made about which computer is found on application developer's desk or lap.
