" https://developer.mbed.org/users/okini3939/notebook ここの順番で
if &filetype == 'cpp' 
syntax keyword MbedType Serial AnalogIn DigitalOut DigitalIn DigitalInOut I2C SPI Timer InterruptIn CAN CANMessage PwmOut Timeout Ticker AnalogOut Ethernet MSCFileSystem Timeout LocalFileSystem SPISlave DNSRequest EhternetNetIf UDPSocket TCPSocket PortInOut PortOut PortIn BusInOut BusOut BusIn I2CSlave
highlight link MbedType Type
endif


colorscheme solarized8
set background=dark
