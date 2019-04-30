/**
 * @Author: Brogan Miner <Brogan>
 * @Date:   2019-04-29T19:32:19-07:00
 * @Email:  brogan.miner@oregonstate.edu
 * @Last modified by:   Brogan
 * @Last modified time: 2019-04-29T21:20:41-07:00
 */

#ifndef HBBLUETOOTHMANAGER
#define HBBLUETOOTHMANAGER

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface HBBlueToothManager : NSObject <CBCentralManagerDelegate> {
  CBPeripheral *_peripheralDevice;
}
@property (strong) CBPeripheral *peripheralDevice;
@end

#endif
