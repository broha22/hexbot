/**
 * @Author: Brogan Miner <Brogan>
 * @Date:   2019-04-28T13:46:14-07:00
 * @Email:  brogan.miner@oregonstate.edu
 * @Last modified by:   Brogan
 * @Last modified time: 2019-05-01T21:43:38-07:00
 */
#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "HBBlueToothManager.h"
#import "HBPeripheral.h"
#include <time.h>
 // @implementation HB_CBDelegate
 //
 // @synthesize peripheralDevice = _peripheralDevice;
 // @synthesize tx = _txCharacteristic;
 // @synthesize rx = _rxCharecteristic;
 //
 // dispatch_semaphore_t __strong * _sem;
 //
 // + (NSObject*)new:(dispatch_semaphore_t __strong *)sem {
 //     NSLog(@"Creating a new delegate");
 //     _sem = sem;
 //     return [super new];
 // }
 // - (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
 //     if ([advertisementData[@"kCBAdvDataLocalName"] isEqualToString: @"Adafruit Bluefruit LE"]) {
 //         [central stopScan];
 //         self.peripheralDevice = peripheral;
 //         [central connectPeripheral:peripheral options:nil];
 //     }
 // }
 // - (void)centralManagerDidUpdateState:(CBCentralManager *)central {
 //     NSLog(@"update state");
 //     if (central.state == CBManagerStatePoweredOn) {
 //         NSLog(@"Powered On");
 //         [central scanForPeripheralsWithServices:nil options:nil];
 //     } else if (central.state == CBManagerStateUnknown) {
 //         NSLog(@"Unknown State");
 //     } else if (central.state == CBManagerStatePoweredOff) {
 //         NSLog(@"Powered Off");
 //     } else {
 //         NSLog(@"Something Else");
 //     }
 // }
 // - (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(nonnull CBCharacteristic *)characteristic error:(nullable NSError *)error {
 //     // NSData *data = characteristic.value;
 // }
 // - (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
 //     for (CBCharacteristic *characteristic in service.characteristics) {
 //         if ([@"6E400003-B5A3-F393-E0A9-E50E24DCCA9E" isEqual:characteristic.UUID.UUIDString]) {
 //             self.rx = characteristic;
 //         } else if ([@"6E400002-B5A3-F393-E0A9-E50E24DCCA9E" isEqual:characteristic.UUID.UUIDString]) {
 //             self.tx = characteristic;
 //             dispatch_semaphore_signal(*_sem);
 //         }
 //         [peripheral readValueForCharacteristic:characteristic];
 //     }
 // }
 // - (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
 //     for (CBService *service in peripheral.services) {
 //        [peripheral discoverCharacteristics:nil forService:service];
 //     }
 // }
 // - (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
 //     NSLog(@"Connected to Device");
 //     peripheral.delegate = self;
 //     [peripheral discoverServices:nil];
 // }
 // @end


int main(int argc, const char * argv[]) {
  @autoreleasepool {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    HBBlueToothManager* delegate = [HBBlueToothManager new:(&sema)];
    [[CBCentralManager alloc] initWithDelegate:delegate  queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)];
    printf("Searching For Device");
    while (dispatch_semaphore_wait(sema, DISPATCH_TIME_NOW)) {
      printf(".");
      sleep(1);
      printf("\b");
      sleep(1);
      printf(" ");
      printf("\b");
    }

    while (true) {
       // [delegate.peripheralDevice writeValue:[@"test" dataUsingEncoding:NSUTF8StringEncoding] forCharacteristic:delegate.tx type:CBCharacteristicWriteWithoutResponse];
       // [NSThread sleepForTimeInterval:2.0f];
       // NSLog(@"Test Command Sent");
    }
  }
  return 0;
}
