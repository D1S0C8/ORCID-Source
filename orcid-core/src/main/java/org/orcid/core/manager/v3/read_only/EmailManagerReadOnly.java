/**
 * =============================================================================
 *
 * ORCID (R) Open Source
 * http://orcid.org
 *
 * Copyright (c) 2012-2014 ORCID, Inc.
 * Licensed under an MIT-Style License (MIT)
 * http://orcid.org/open-source-license
 *
 * This copyright and license information (including a link to the full license)
 * shall be included in its entirety in all copies or substantial portion of
 * the software.
 *
 * =============================================================================
 */
package org.orcid.core.manager.v3.read_only;

import java.util.List;
import java.util.Map;

import org.orcid.jaxb.model.v3.dev1.record.Email;
import org.orcid.jaxb.model.v3.dev1.record.Emails;
import org.orcid.persistence.jpa.entities.EmailEntity;

/**
 * 
 * @author Will Simpson
 *
 */
public interface EmailManagerReadOnly extends ManagerReadOnlyBase {

    boolean emailExists(String email);

    String findOrcidIdByEmail(String email);
    
    Map<String, String> findOricdIdsByCommaSeparatedEmails(String email);
    
    Map<String, String> findIdsByEmails(List<String> emailList);
    
    boolean isPrimaryEmailVerified(String orcid);
    
    boolean haveAnyEmailVerified(String orcid);
    
    Emails getEmails(String orcid);
    
    Emails getPublicEmails(String orcid);
    
    boolean isPrimaryEmail(String orcid, String email);
    
    EmailEntity findCaseInsensitive(String email);
    
    EmailEntity find(String email);
    
    Email findPrimaryEmail(String orcid);

    boolean isPrimaryEmail(String email);
}
