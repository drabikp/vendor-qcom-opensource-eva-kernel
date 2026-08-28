KBUILD_OPTIONS+= EVA_ROOT=$(KERNEL_SRC)/$(M)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules $(KBUILD_OPTIONS)

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)

clean:
	rm -f *.o *.ko *.mod.c *.mod.o *~ .*.cmd Module.symvers
	rm -rf .tmp_versions

# ---- arcfox kernel.mk port ----
KBUILD_OPTIONS += KCPPFLAGS="-I$(KERNEL_SRC)/../sm8635-modules/qcom/opensource/dsp-kernel/include/linux -I$(KERNEL_SRC)/../sm8635-modules/qcom/opensource/dsp-kernel/include/uapi"
KBUILD_OPTIONS += KBUILD_EXTRA_SYMBOLS="$(OUT_DIR)/../sm8635-modules/qcom/opensource/synx-kernel/Module.symvers $(OUT_DIR)/../sm8635-modules/qcom/opensource/dsp-kernel/Module.symvers $(OUT_DIR)/../sm8635-modules/qcom/opensource/mmrm-driver/Module.symvers"
