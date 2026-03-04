################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
BusyWait.o: ../BusyWait.s $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg" $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Clock.o: /Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare\ (1)/inc/Clock.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Clock.d_raw" -MT"Clock.o" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

LaunchPad.o: /Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare\ (1)/inc/LaunchPad.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"LaunchPad.d_raw" -MT"LaunchPad.o" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

SPI.o: /Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare\ (1)/inc/SPI.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"SPI.d_raw" -MT"SPI.o" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

ST7735.o: /Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare\ (1)/inc/ST7735.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"ST7735.d_raw" -MT"ST7735.o" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

StringConversion.o: ../StringConversion.s $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg" $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Timer.o: /Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare\ (1)/inc/Timer.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs2030/ccs/tools/compiler/ti-cgt-armllvm_4.0.4.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_2_09_00_01/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Timer.d_raw" -MT"Timer.o" -I"/Users/chi-chinwosu/Desktop/MSPM0_ValvanoWare (1)/ECE319K_Lab6/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


