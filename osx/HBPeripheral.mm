/**
 * @Author: Brogan Miner <Brogan>
 * @Date:   2019-04-29T21:22:06-07:00
 * @Email:  brogan.miner@oregonstate.edu
 * @Last modified by:   Brogan
 * @Last modified time: 2019-05-01T20:58:46-07:00
 */

#import "HBPeripheral.h"

@implementation HBPeripheral

@synthesize tx = _txCharacteristic;
@synthesize rx = _rxCharecteristic;

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    // Set tx of delegate so we can transmit
    // for (CBCharacteristic *characteristic in service.characteristics) {
    //     if ([@"6E400003-B5A3-F393-E0A9-E50E24DCCA9E" isEqual:characteristic.UUID.UUIDString]) {
    //         self.rx = characteristic;
    //     } else if ([@"6E400002-B5A3-F393-E0A9-E50E24DCCA9E" isEqual:characteristic.UUID.UUIDString]) {
    //         self.tx = characteristic;
    //         dispatch_semaphore_signal(*_sem);
    //     }
    //     [peripheral readValueForCharacteristic:characteristic];
    // }
}
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    // // ??
    // for (CBService *service in peripheral.services) {
    //    [peripheral discoverCharacteristics:nil forService:service];
    // }
}
@end
