waitForLeftArm=function(waitNumber,nextNumber)
    while true do
        stage=sim.getIntegerSignal(leftArmSignalName)
print("left")
        if (stage==waitNumber) then
            break
        end
        sim.switchThread() -- don't waste CPU time
    end
    sim.setIntegerSignal(leftArmSignalName,nextNumber)
end

waitForRightArm=function(waitNumber,nextNumber)
    while true do
        stage=sim.getIntegerSignal(rightArmSignalName)
print("right")
        if (stage==waitNumber) then
            break
        end
        sim.switchThread() -- don't waste CPU time
    end
    sim.setIntegerSignal(rightArmSignalName,nextNumber)
end

waitForLeftRight=function(waitNumber,nextNumber)
    while true do
        stager=sim.getIntegerSignal(rightArmSignalName)
        stagel=sim.getIntegerSignal(leftArmSignalName)
--print(stagel,stager)

        if (stager==waitNumber and stagel==waitNumber) then
            break
        end
        --sim.switchThread() -- don't waste CPU time
    end
    sim.setIntegerSignal(rightArmSignalName,nextNumber)
    sim.setIntegerSignal(leftArmSignalName,nextNumber)
end

function sysCall_threadmain()
    monitorJointHandle=sim.getObjectHandle('Baxter_monitorJoint')
    name=sim.getObjectName(monitorJointHandle)
    suffix=sim.getNameSuffix(name)

    leftArmSignalName='BaxterLeftArmSignal'
    if (suffix>=0) then
        leftArmSignalName=leftArmSignalName..'#'..suffix
    end

    rightArmSignalName='BaxterRightArmSignal'
    if (suffix>=0) then
        rightArmSignalName=rightArmSignalName..'#'..suffix
    end

    -- Come to home position
    waitForLeftRight(0,1)
    waitForLeftRight(2,2)

    -- DO IK 
    -- Now tell the two arms to move close to each other:
    waitForLeftRight(2,3)
    waitForLeftRight(4,4)
    print('1')
    waitForLeftRight(4,5)
    waitForLeftRight(6,6)
    print('2')
    waitForLeftRight(6,7)
    waitForLeftRight(8,8)
    print('3')
    waitForLeftRight(8,9)
    waitForLeftRight(10,10)
    print('4')
    waitForLeftRight(10,11)
    waitForLeftRight(10,11)
    
end
