

CFLAGS:= -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft 
CFLAGS+= -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0

CPPFLAGS:= -DSTM32L031xx -DUSE_STM32L0XX_NUCLEO_32 -DUSE_HAL_DRIVER 

ASFLAGS:= -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -g 

INC:= -I./Inc -I./Src/CMSIS/Device/ST/STM32L0xx/Include -I./Src/STM32L0xx_HAL_Driver/Inc -I./Src/BSP/STM32L0xx_Nucleo_32 -I./Src/CMSIS/Include

all:
	mkdir -p build
	arm-none-eabi-as $(ASFLAGS) -o ./build/startup_stm32l031xx.o ./startup_stm32l031xx.s
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/main.o ./Src/main.c
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/stm32l0xx_it.o ./Src/stm32l0xx_it.c
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/stm32l0xx_hal.o ./Src/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal.c
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/stm32l0xx_hal_cortex.o ./Src/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal_cortex.c
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/stm32l0xx_hal_gpio.o ./Src/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal_gpio.c
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/stm32l0xx_hal_rcc.o ./Src/STM32L0xx_HAL_Driver/Src/stm32l0xx_hal_rcc.c
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/system_stm32l0xx.o ./Src/system_stm32l0xx.c
	arm-none-eabi-gcc $(CFLAGS) $(CPPFLAGS) $(INC) -o ./build/stm32l0xx_nucleo_32.o ./Src/BSP/STM32L0xx_Nucleo_32/stm32l0xx_nucleo_32.c
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -T./STM32L031K6_FLASH.ld -Wl,-Map=output.map -Wl,--gc-sections -lm -o build/STM32L031K6_NUCLEO.elf ./build/*o

clean:
	rm -rfv ./build
