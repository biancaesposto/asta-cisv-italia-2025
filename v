import { useState } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";

const bidsInitial = [];

export default function AstaCISV() {
  const [bids, setBids] = useState(bidsInitial);
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [amount, setAmount] = useState("");

  const submitBid = () => {
    if (!name || !email || !phone || !amount) return;
    setBids([...bids, { name, email, phone, amount: parseFloat(amount) }]);
    setName("");
    setEmail("");
    setPhone("");
    setAmount("");
  };

  const highestBid = bids.length > 0 ? Math.max(...bids.map((b) => b.amount)) : 0;

  return (
    <div className="max-w-3xl mx-auto p-6 space-y-6">
      <h1 className="text-3xl font-bold text-center">Asta CISV Italia 2025</h1>
      <p className="text-center text-gray-600">
        L'asta inizia venerdì 9 maggio ore 9:00 e termina sabato 10 maggio ore 19:30.
      </p>

      <Card>
        <CardContent className="p-4 space-y-2">
          <h2 className="text-xl font-semibold">Oggetto all'asta:</h2>
          <p className="text-lg">Due notti presso Casa Trentini Atemporary Art Apartments</p>
          <p className="text-sm text-gray-500">Prezzo base: nessun minimo obbligatorio</p>
          <p className="font-medium">
            Offerta più alta: {highestBid > 0 ? `${highestBid} €` : "Nessuna offerta ancora"}
          </p>
        </CardContent>
      </Card>

      <Card>
        <CardContent className="p-4 space-y-4">
          <h3 className="text-lg font-semibold">Fai la tua offerta</h3>
          <Input placeholder="Nome" value={name} onChange={(e) => setName(e.target.value)} />
          <Input placeholder="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
          <Input placeholder="Telefono" value={phone} onChange={(e) => setPhone(e.target.value)} />
          <Input
            placeholder="Offerta (€)"
            type="number"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
          />
          <Button onClick={submitBid}>Invia offerta</Button>
        </CardContent>
      </Card>

      <div>
        <h4 className="text-md font-semibold">Ultime offerte:</h4>
        <ul className="space-y-1">
          {bids.map((bid, index) => (
            <li key={index} className="text-sm">
              {bid.name} - {bid.amount} €
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}
