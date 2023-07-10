#include "CaLoggingService.h"
#include "artery/traci/VehicleController.h"
#include <omnetpp/cpacket.h>
#include <vanetza/btp/data_request.hpp>
#include <vanetza/dcc/profile.hpp>
#include <vanetza/geonet/interface.hpp>

using namespace omnetpp;
using namespace vanetza;

namespace artery
{

static const simsignal_t scSignalCamReceived = cComponent::registerSignal("CamReceived");

Define_Module(CaLoggingService)

CaLoggingService::CaLoggingService()
{
}

CaLoggingService::~CaLoggingService()
{
    cancelAndDelete(m_self_msg);
}

void CaLoggingService::indicate(const btp::DataIndication& ind, cPacket* packet, const NetworkInterface& net)
{
    Enter_Method("indicate");

    if (packet->getByteLength() == 42) {
        EV_INFO << "packet indication on channel " << net.channel << "\n";
    }

    delete(packet);
}

void CaLoggingService::initialize()
{
    ItsG5Service::initialize();
    m_self_msg = new cMessage("Example Service");
    subscribe(scSignalCamReceived);

    scheduleAt(simTime() + 3.0, m_self_msg);
}

void CaLoggingService::finish()
{
    // you could record some scalars at this point
    ItsG5Service::finish();
}

void CaLoggingService::handleMessage(cMessage* msg)
{
    Enter_Method("handleMessage");

    if (msg == m_self_msg) {
        EV_INFO << "self message\n";
    }
}

void CaLoggingService::trigger()
{
    Enter_Method("trigger");

    // use an ITS-AID reserved for testing purposes
    static const vanetza::ItsAid example_its_aid = 16480;

    auto& mco = getFacilities().get_const<MultiChannelPolicy>();
    auto& networks = getFacilities().get_const<NetworkInterfaceTable>();

    for (auto channel : mco.allChannels(example_its_aid)) {
        auto network = networks.select(channel);
        if (network) {
            btp::DataRequestB req;
            // use same port number as configured for listening on this channel
            req.destination_port = host_cast(getPortNumber(channel));
            req.gn.transport_type = geonet::TransportType::SHB;
            req.gn.traffic_class.tc_id(static_cast<unsigned>(dcc::Profile::DP3));
            req.gn.communication_profile = geonet::CommunicationProfile::ITS_G5;
            req.gn.its_aid = example_its_aid;

            cPacket* packet = new cPacket("Example Service Packet");
            packet->setByteLength(42);

            // send packet on specific network interface
            request(req, packet, network.get());
        } else {
            EV_ERROR << "No network interface available for channel " << channel << "\n";
        }
    }
}

void CaLoggingService::receiveSignal(cComponent* source, simsignal_t signal, cObject* c_obj, cObject*)
{
    Enter_Method("receiveSignal");

    if (signal == scSignalCamReceived) {
        auto& vehicle = getFacilities().get_const<traci::VehicleController>();
        EV_INFO << "Vehicle " << vehicle.getVehicleId() << " received a CAM in sibling serivce\n";

        CaObject* ca = dynamic_cast<CaObject*>(c_obj);
        const CamParameters_t& params = ca->asn1()->cam.camParameters;

        if (params.highFrequencyContainer.present == HighFrequencyContainer_PR_basicVehicleContainerHighFrequency) {
            const BasicVehicleContainerHighFrequency_t& highFrequencyContainer = params.highFrequencyContainer.choice.basicVehicleContainerHighFrequency;
            EV_ERROR << "CAM: speed: " << highFrequencyContainer.speed.speedValue << ' ';
        }

        const BasicContainer_t& basicContainer = params.basicContainer;
        EV_ERROR << "latitude: " << basicContainer.referencePosition.latitude << ' ';
        EV_ERROR << "longitude: " << basicContainer.referencePosition.longitude << '\n';

       // EV_ERROR << camLog;
    }
}

} // namespace artery

