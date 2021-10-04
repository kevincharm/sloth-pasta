#if defined(__x86_64) || defined(__x86_64__)
# if defined(__ELF__)
#  include "elf/add_mod_pasta-x86_64.s"
#  if defined(__ADX__) && !defined(__PASTA_PORTABLE__)
#   include "elf/mulx_mont_pasta-x86_64.s"
#  else
#   include "elf/mulq_mont_pasta-x86_64.s"
#  endif
# elif defined(_WIN64) || defined(__CYGWIN__)
#  include "coff/add_mod_pasta-x86_64.s"
#  if defined(__ADX__) && !defined(__PASTA_PORTABLE__)
#   include "coff/mulx_mont_pasta-x86_64.s"
#  else
#   include "coff/mulq_mont_pasta-x86_64.s"
#  endif
# elif defined(__APPLE__)
#  include "mach-o/add_mod_pasta-x86_64.s"
#  if defined(__ADX__) && !defined(__PASTA_PORTABLE__)
#   include "mach-o/mulx_mont_pasta-x86_64.s"
#  else
#   include "mach-o/mulq_mont_pasta-x86_64.s"
#  endif
# endif
#elif defined(__aarch64__)
# if defined(__ELF__)
#  include "elf/add_mod_pasta-armv8.S"
#  include "elf/mul_mont_pasta-armv8.S"
# elif defined(_WIN64)
#  include "coff/add_mod_pasta-armv8.S"
#  include "coff/mul_mont_pasta-armv8.S"
# elif defined(__APPLE__)
#  include "mach-o/add_mod_pasta-armv8.S"
#  include "mach-o/mul_mont_pasta-armv8.S"
# endif
#else
# error "unsupported platform"
#endif
