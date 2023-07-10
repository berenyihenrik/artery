//
// Created by beren on 5/14/2023.
//

//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

#ifndef ARTERY_CALOGGINGSERVICE_H
#define ARTERY_CALOGGINGSERVICE_H

#include "artery/application/ItsG5Service.h"
#include "artery/application/NetworkInterface.h"

namespace artery
{

class CaLoggingService : public ItsG5Service
{
public:
    CaLoggingService();
    ~CaLoggingService();

    void indicate(const vanetza::btp::DataIndication&, omnetpp::cPacket*, const NetworkInterface&) override;
    void trigger() override;
    void receiveSignal(omnetpp::cComponent*, omnetpp::simsignal_t, omnetpp::cObject*, omnetpp::cObject*) override;

protected:
    void initialize() override;
    void finish() override;
    void handleMessage(omnetpp::cMessage*) override;

private:
    omnetpp::cMessage* m_self_msg;
};

} // namespace artery

#endif  // ARTERY_CALOGGINGSERVICE_H