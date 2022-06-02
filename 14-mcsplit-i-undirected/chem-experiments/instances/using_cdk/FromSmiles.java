import java.util.HashMap;

import org.openscience.cdk.*;
import org.openscience.cdk.exception.*;
import org.openscience.cdk.interfaces.*;
import org.openscience.cdk.smiles.*;

class FromSmiles {
    public static void main(String[] args) {
        SmilesParser sp = new SmilesParser(DefaultChemObjectBuilder.getInstance());
        try {
            String smiles = args[0];
            IAtomContainer m = sp.parseSmiles(smiles);
            HashMap<IAtom, Integer> atomToInt = new HashMap<IAtom, Integer>();
            System.out.printf("p edge %d %d%n", m.getAtomCount(), m.getBondCount());
            int atomCount = 0;
            for (IAtom atom : m.atoms()) {
                System.out.printf("v %d %d%n", atomCount+1, atom.getAtomicNumber());
                atomToInt.put(atom, atomCount++);
            }
            for (IBond bond : m.bonds()) {
                int firstAtom = atomToInt.get(bond.getBegin());
                int secondAtom = atomToInt.get(bond.getEnd());
                int order = bond.getOrder().numeric();
                boolean isAromatic = bond.isAromatic();
                int edgeType = isAromatic ? 99 : order;
                System.out.printf("E %d %d %d%n", firstAtom+1, secondAtom+1, edgeType);
            }
        } catch (InvalidSmilesException e) {
            System.out.println("ERROR");
            e.printStackTrace();
            System.exit(1);
        }
    }
}
