--Takes to the start position
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
print(stagel,stager)

        if (stager==waitNumber and stagel==waitNumber) then
            break
        end
        --Uncommenting this gives non-synchronized motion between left and right arm
        --sim.switchThread() -- don't waste CPU time
    end
    sim.setIntegerSignal(rightArmSignalName,nextNumber)
    sim.setIntegerSignal(leftArmSignalName,nextNumber)
print('what')
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

    -- Tell the left arm to start movement:
    --waitForLeftArm(0,1)

    -- Move the head towards the left arm:
    --sim.setJointTargetPosition(monitorJointHandle,30*math.pi/180)

    -- Wait 7 seconds:
    --sim.wait(7)

    -- Tell the right arm to start movement:
    --waitForRightArm(0,1)

    -- Move the head towards the right arm:
    --sim.setJointTargetPosition(monitorJointHandle,-30*math.pi/180)

    -- Wait 5 seconds:
    --sim.wait(5)

    -- Wait until the left arm is done for the first part:
    --waitForLeftArm(2,2)

    -- Move the head towards the center:
    --sim.setJointTargetPosition(monitorJointHandle,0*math.pi/180)

    -- Wait until the right arm is done for the first part:
    --waitForRightArm(2,2)
    waitForLeftRight(0,1)
    print('a')
    waitForLeftRight(2,2)
    print('b')
end