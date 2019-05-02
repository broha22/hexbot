/**
 * @Author: Brogan Miner <Brogan>
 * @Date:   2019-04-29T19:32:19-07:00
 * @Email:  brogan.miner@oregonstate.edu
 * @Last modified by:   Brogan
 * @Last modified time: 2019-05-01T20:58:20-07:00
 */

#ifndef HBBLUETOOTHMANAGER
#define HBBLUETOOTHMANAGER

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface HBBlueToothManager : NSObject <CBCentralManagerDelegate> {
@public
  CBPeripheral *_peripheralDevice;
  dispatch_semaphore_t __strong * _sem;
}
@property (strong) CBPeripheral *peripheralDevice;
+ (HBBlueToothManager *)new:(dispatch_semaphore_t __strong *)sema;
@end

#endif
