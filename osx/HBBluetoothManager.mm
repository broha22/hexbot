/**
 * @Author: Brogan Miner <Brogan>
 * @Date:   2019-04-29T20:12:32-07:00
 * @Email:  brogan.miner@oregonstate.edu
 * @Last modified by:   Brogan
 * @Last modified time: 2019-04-29T21:19:24-07:00
 */

#import "HBBlueToothManager.h"

@implementation HBBlueToothManager

/* REQUIRED */
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
  if (central.state == CBManagerStatePoweredOn) {
    //Check for BLE support on device
    [central scanForPeripheralsWithServices:nil options:nil];
  } else if (central.state == CBManagerStateUnknown) {
    //Restart the service and try to connect back to devices
  } else if (central.state == CBManagerStatePoweredOff) {
    //Clean and end process
  } else {
    //Throw error and terminate
  }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
      //Send update with semaphore to device listener / user input handler
}
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
      // NSLog(@"Connected to Device");
      // peripheral.delegate = self;
      // [peripheral discoverServices:nil];
      // Latch delegate and discover the associated services
}
@end
