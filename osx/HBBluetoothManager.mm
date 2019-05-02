/**
 * @Author: Brogan Miner <Brogan>
 * @Date:   2019-04-29T20:12:32-07:00
 * @Email:  brogan.miner@oregonstate.edu
 * @Last modified by:   Brogan
 * @Last modified time: 2019-05-01T21:16:34-07:00
 */

#import "HBBlueToothManager.h"

@implementation HBBlueToothManager

+ (HBBlueToothManager *)new:(dispatch_semaphore_t __strong *)sema {
  HBBlueToothManager* instance = [super new];
  instance->_sem = sema;
  return instance;
}

// - (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
//     if ([advertisementData[@"kCBAdvDataLocalName"] isEqualToString: @"Adafruit Bluefruit LE"]) {
//         [central stopScan];
//         self.peripheralDevice = peripheral;
//         [central connectPeripheral:peripheral options:nil];
//     }
// }

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
      // dispatch_semaphore_signal(*self->_sem);
}
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {

      // NSLog(@"Connected to Device");
      // peripheral.delegate = self;
      // [peripheral discoverServices:nil];
      // Latch delegate and discover the associated services
}
@end
