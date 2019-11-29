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
    end_ = 8
    for i=0,end_,2 do 
        waitForLeftRight(i,i+1)
        waitForLeftRight(i+2,i+2) 
        print(i)
    end
    waitForLeftRight(end_+2,end_+3)
end
