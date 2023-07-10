//
// Created by beren on 5/21/2023.
//

#ifndef ARTERY_RSUCALOGGINGSERVICE_H
#define ARTERY_RSUCALOGGINGSERVICE_H

#include "artery/application/CaLoggingService.h"
#include "artery/application/NetworkInterface.h"

namespace artery
{

class RsuCaLoggingService : public CaLoggingService
{
public:
    RsuCaLoggingService();
    ~RsuCaLoggingService();

    void receiveSignal(omnetpp::cComponent*, omnetpp::simsignal_t, omnetpp::cObject*, omnetpp::cObject*) override;
private:
    omnetpp::cMessage* m_self_msg;
};

} // namespace artery



#endif  // ARTERY_RSUCALOGGINGSERVICE_H
