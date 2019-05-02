/**
 * @Author: Brogan Miner <Brogan>
 * @Date:   2019-04-29T19:36:24-07:00
 * @Email:  brogan.miner@oregonstate.edu
 * @Last modified by:   Brogan
 * @Last modified time: 2019-05-01T20:58:55-07:00
 */

#ifndef HBPERIPHERAL
#define HBPERIPHERAL

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface HBPeripheral : NSObject <CBPeripheralDelegate> {
@public
    CBCharacteristic *_rxCharecteristic;
    CBCharacteristic *_txCharacteristic;
}
@property (strong) CBCharacteristic *tx;
@property (strong) CBCharacteristic *rx;
@end

#endif
