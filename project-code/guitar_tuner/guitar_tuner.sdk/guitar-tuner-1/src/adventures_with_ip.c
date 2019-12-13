/*
 * adventures_with_ip.c
 *
 * Main source file. Contains main() and menu() functions.
 */
#include "adventures_with_ip.h"

/* ---------------------------------------------------------------------------- *
 * 									main()										*
 * ---------------------------------------------------------------------------- *
 * Runs all initial setup functions to initialise the audio codec and IP
 * peripherals, before calling the interactive menu system.
 * ---------------------------------------------------------------------------- */
int main(void)
{
	xil_printf("Entering Main\r\n");
	//Configure the IIC data structure
	IicConfig(XPAR_XIICPS_0_DEVICE_ID);

	//Configure the Audio Codec's PLL
	AudioPllConfig();

	xil_printf("SSM2603 configured\n\r");

	/* Initialise GPIO and NCO peripherals */
	gpio_init();


	xil_printf("GPIO and NCO peripheral configured\r\n");


	 init_platform();

	    int status;
	    status = XGpio_Initialize(&Gpio, GPIO_DEVICE_ID);
	    if(status != XST_SUCCESS){
	    	return XST_FAILURE;
	    }

	    XGpio_SetDataDirection(&Gpio, SSD_CHANNEL, 0x00);

	    u32 samples[1024];
	    int i = 0;
	    u32 average_value;
	    while(1)
	    {
	    	// collect 1024 samples
	    	samples[i++] = get_avg();
	    	if(i == 1024)
	    	{
	    		i = 0;
	    		u32 sum = 0;
	    		// get average of 1024 samples
	    		for(int j=0; j<1024; j++)
	    		{
	    			sum += samples[j]>> 10;
	    		}
	    		average_value = sum >> 2;
	    	}
	    	// XGpio_DiscreteWrite(&Gpio, SSD_CHANNEL, 0x67);

	    	XGpio_DiscreteWrite(&Gpio, SSD_CHANNEL, average_value & 0xFF);
	    	usleep(1000);
	    	// XGpio_DiscreteWrite(&Gpio, SSD_CHANNEL, ~average_value);
	    	// XGpio_DiscreteWrite(&Gpio, SSD_CHANNEL, 0xFF);
	    	usleep(10);

	    }

	    cleanup_platform();
	    return 0;
	/* Display interactive menu interface via terminal */
    return 1;
}


