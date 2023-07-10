#include "RsuCaLoggingService.h"
#include <omnetpp/cpacket.h>
#include <vanetza/btp/data_request.hpp>
#include <vanetza/dcc/profile.hpp>
#include <vanetza/geonet/interface.hpp>

using namespace omnetpp;
using namespace vanetza;

namespace artery
{

static const simsignal_t scSignalCamReceived = cComponent::registerSignal("CamReceived");

Define_Module(RsuCaLoggingService)

RsuCaLoggingService::RsuCaLoggingService()
{
}

RsuCaLoggingService::~RsuCaLoggingService()
{
    cancelAndDelete(m_self_msg);
}

void RsuCaLoggingService::receiveSignal(cComponent* source, simsignal_t signal, cObject* c_obj, cObject*)
{
    Enter_Method("receiveSignal");

    if (signal == scSignalCamReceived) {
        CaObject* ca = dynamic_cast<CaObject*>(c_obj);
        const CamParameters_t& params = ca->asn1()->cam.camParameters;

        if (params.highFrequencyContainer.present == HighFrequencyContainer_PR_basicVehicleContainerHighFrequency) {
            const BasicVehicleContainerHighFrequency_t& highFrequencyContainer = params.highFrequencyContainer.choice.basicVehicleContainerHighFrequency;
            EV_ERROR << "CAM: speed: " << highFrequencyContainer.speed.speedValue << ' ';
        }

        const BasicContainer_t& basicContainer = params.basicContainer;
        EV_ERROR << "latitude: " << basicContainer.referencePosition.latitude << ' ';
        EV_ERROR << "longitude: " << basicContainer.referencePosition.longitude << '\n';
    }
}

} // namespace artery

