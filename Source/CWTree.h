//
//  CWTree.h
//  Zangetsu
//
//  Created by Colin Wheeler on 7/12/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWTreeNode : NSObject
//vars
@property(nonatomic, retain) id value;
@property(nonatomic, assign) __weak id parent;
@property(nonatomic, readonly, retain) NSMutableArray *children;
//methods
-(id)initWithValue:(id)aValue;
-(void)addChild:(CWTreeNode *)node;
-(void)removeChild:(CWTreeNode *)node;
//comparisons
-(BOOL)isEqualTo:(id)node;
-(BOOL)isNodeValueEqualTo:(id)node;
@end

@interface CWTree : NSObject
-(id)initWithRootNodeValue:(id)value;
@property(nonatomic, retain) CWTreeNode *rootNode;
@end