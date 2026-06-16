RISCV_PREFIX ?= riscv-none-elf-
CC      := $(RISCV_PREFIX)gcc
OBJCOPY := $(RISCV_PREFIX)objcopy
OBJDUMP := $(RISCV_PREFIX)objdump
SIZE    := $(RISCV_PREFIX)size

PROJ    := firmware
BUILD   := build

MARCH   := rv32im_zicsr_zifencei
MABI    := ilp32

LDSCRIPT := link.ld

CSRCS   := main.c
ASRCS   := crt.S

vpath %.c src
vpath %.S src

OBJS    := $(addprefix $(BUILD)/,$(CSRCS:.c=.o) $(ASRCS:.S=.o))
DEPS    := $(OBJS:.o=.d)

ARCHFLAGS := -march=$(MARCH) -mabi=$(MABI) -mcmodel=medany

CFLAGS  := $(ARCHFLAGS)
CFLAGS  += -Iheaders
CFLAGS  += -Os -g3
CFLAGS  += -ffreestanding
CFLAGS  += -ffunction-sections -fdata-sections
CFLAGS  += -Wall -Wextra -Wundef -Wshadow
CFLAGS  += -std=gnu11
CFLAGS  += -MMD -MP

ASFLAGS := $(ARCHFLAGS) -MMD -MP

LDFLAGS := $(ARCHFLAGS)
LDFLAGS += -nostartfiles
LDFLAGS += -T $(LDSCRIPT)
LDFLAGS += -Wl,--gc-sections
LDFLAGS += -Wl,-Map=$(BUILD)/$(PROJ).map
LDFLAGS += -Wl,--print-memory-usage

LDLIBS  := -lgcc

.PHONY: all clean size dump

all: $(BUILD)/$(PROJ).elf $(BUILD)/$(PROJ).bin $(BUILD)/$(PROJ).hex $(BUILD)/$(PROJ).lst size

$(BUILD):
	@mkdir -p $(BUILD)

$(BUILD)/%.o: %.c | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o: %.S | $(BUILD)
	$(CC) $(ASFLAGS) -c $< -o $@

$(BUILD)/$(PROJ).elf: $(OBJS) $(LDSCRIPT)
	$(CC) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $@

$(BUILD)/%.bin: $(BUILD)/%.elf
	$(OBJCOPY) -O binary $< $@

$(BUILD)/%.hex: $(BUILD)/%.elf
	$(OBJCOPY) -O verilog $< $@

$(BUILD)/%.lst: $(BUILD)/%.elf
	$(OBJDUMP) -S -d $< > $@

size: $(BUILD)/$(PROJ).elf
	@echo "---- section sizes ----"
	@$(SIZE) $<

dump: $(BUILD)/$(PROJ).elf
	$(OBJDUMP) -S -d $<

clean:
	rm -rf $(BUILD)

-include $(DEPS)