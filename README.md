# Nucleo32
This project template is based on the STM32CubeL0 examples that can be found here http://www.st.com/web/en/catalog/tools/PF260508.

I tried to extract only the files that are needed for the STM32L031K6 development board to have a clear directory structure that is not too "bloated" with other files for other microcontrollers or development boards.
There is still room for optimizations and I know the makefile is far from optimal but at least it's simple and easy to understand. 

*Note: for __openocd__ to work, you'll need to install System Workbench for STM32 to have the correct openocd version with the latest patches. See http://www.openstm32.org/tiki-view_forum_thread.php?comments_parentId=1360 for more information. Then you'll need to change the paths in the start_openocd.sh script.* 

![alt text](http://www.st.com/st-web-ui/static/active/en/fragment/product_related/rpn_information/board_photo/ulp_nucleo-32.jpg "Logo Title Text 1")
