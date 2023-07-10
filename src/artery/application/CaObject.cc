#include <artery/application/CaObject.h>
#include <omnetpp.h>
#include <cassert>

namespace artery
{

using namespace vanetza::asn1;

Register_Abstract_Class(CaObject)

CaObject::CaObject(Cam&& cam) :
    m_cam_wrapper(std::make_shared<Cam>(std::move(cam)))
{
}

CaObject& CaObject::operator=(Cam&& cam)
{
    m_cam_wrapper = std::make_shared<Cam>(std::move(cam));
    return *this;
}

CaObject::CaObject(const Cam& cam) :
    m_cam_wrapper(std::make_shared<Cam>(cam))
{
}

CaObject& CaObject::operator=(const Cam& cam)
{
    m_cam_wrapper = std::make_shared<Cam>(cam);
    return *this;
}

CaObject::CaObject(const std::shared_ptr<const Cam>& ptr) :
    m_cam_wrapper(ptr)
{
    assert(m_cam_wrapper);
}

CaObject& CaObject::operator=(const std::shared_ptr<const Cam>& ptr)
{
    m_cam_wrapper = ptr;
    assert(m_cam_wrapper);
    return *this;
}

std::shared_ptr<const Cam> CaObject::shared_ptr() const
{
    assert(m_cam_wrapper);
    return m_cam_wrapper;
}

const vanetza::asn1::Cam& CaObject::asn1() const
{
    return *m_cam_wrapper;
}

omnetpp::cObject* CaObject::dup() const
{
    return new CaObject { *this };
}

using namespace omnetpp;

class CamStationIdResultFilter : public cObjectResultFilter
{
protected:
    void receiveSignal(cResultFilter* prev, simtime_t_cref t, cObject* object, cObject* details) override
    {
        if (auto cam = dynamic_cast<CaObject*>(object)) {
            const auto id = cam->asn1()->header.stationID;
            fire(this, t, id, details);
        }
    }
};

Register_ResultFilter("camStationId", CamStationIdResultFilter)


class CamGenerationDeltaTimeResultFilter : public cObjectResultFilter
{
protected:
    void receiveSignal(cResultFilter* prev, simtime_t_cref t, cObject* object, cObject* details) override
    {
        if (auto cam = dynamic_cast<CaObject*>(object)) {
            const auto genDeltaTime = cam->asn1()->cam.generationDeltaTime;
            fire(this, t, genDeltaTime, details);
        }
    }
};

Register_ResultFilter("camGenerationDeltaTime", CamGenerationDeltaTimeResultFilter)

class CamSpeedFilter : public cObjectResultFilter
{
protected:
    void receiveSignal(cResultFilter* prev, simtime_t_cref t, cObject* object, cObject* details) override
    {
        if (auto cam = dynamic_cast<CaObject*>(object)) {
            long speedValue;
            const CamParameters_t& params = cam->asn1()->cam.camParameters;
            if (params.highFrequencyContainer.present == HighFrequencyContainer_PR_basicVehicleContainerHighFrequency) {
                const BasicVehicleContainerHighFrequency_t& highFrequencyContainer = params.highFrequencyContainer.choice.basicVehicleContainerHighFrequency;
                speedValue = highFrequencyContainer.speed.speedValue;
            }

            fire(this, t, speedValue, details);
        }
    }
};

Register_ResultFilter("camSpeed", CamSpeedFilter)

class CamLatitudeFilter : public cObjectResultFilter
{
protected:
    void receiveSignal(cResultFilter* prev, simtime_t_cref t, cObject* object, cObject* details) override
    {
        if (auto cam = dynamic_cast<CaObject*>(object)) {
            const CamParameters_t& params = cam->asn1()->cam.camParameters;
            const BasicContainer_t& basicContainer = params.basicContainer;
            const auto latitude = basicContainer.referencePosition.latitude;

            fire(this, t, latitude, details);
        }
    }
};

Register_ResultFilter("camLatitude", CamLatitudeFilter)

class CamLongitudeFilter : public cObjectResultFilter
{
protected:
    void receiveSignal(cResultFilter* prev, simtime_t_cref t, cObject* object, cObject* details) override
    {
        if (auto cam = dynamic_cast<CaObject*>(object)) {
            const CamParameters_t& params = cam->asn1()->cam.camParameters;
            const BasicContainer_t& basicContainer = params.basicContainer;
            const auto longitude = basicContainer.referencePosition.longitude;

            fire(this, t, longitude, details);
        }
    }
};

Register_ResultFilter("camLongitude", CamLongitudeFilter)

} // namespace artery
